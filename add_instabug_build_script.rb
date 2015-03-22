require 'xcodeproj'

INSTABUG_PHASE_NAME = "Upload Instabug dSYM"
INSTABUG_PHASE_SCRIPT = <<-SCRIPTEND
  # SKIP_SIMULATOR_BUILDS=1
  SCRIPT_SRC=$(find "$PROJECT_DIR" -name 'Instabug_dsym_upload.sh' | head -1)
  if [ ! "${SCRIPT_SRC}" ]; then
    echo "Instabug: err: script not found. Make sure that you're including Instabug.bundle in your project directory"
    exit 1
  fi
  source "${SCRIPT_SRC}"
  SCRIPTEND
  
current_path = nil
while current_path != Dir.pwd
  current_path = Dir.pwd
  project_path = Dir.glob("#{current_path}/*.xcodeproj")
  
  unless project_path.first.nil?
    project = Xcodeproj::Project.open(project_path.first)
    targets = project.targets
    
    targets.each do |target|
      if target.product_type == "com.apple.product-type.application" or target.product_type == "com.apple.product-type.app-extension"
        if target.shell_script_build_phases.detect { |existing_build_phase| existing_build_phase.name == INSTABUG_PHASE_NAME } == nil
          phase = target.new_shell_script_build_phase(INSTABUG_PHASE_NAME)
          phase.shell_script = INSTABUG_PHASE_SCRIPT
          project.save()
        end
      end
    end
    
    break
  end

  Dir.chdir("..")
end
