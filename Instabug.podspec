Pod::Spec.new do |s|
  Pod::Installer::UserProjectIntegrator::TargetIntegrator.class_eval do
    unless method_defined?(:integrate_with_instabug!)
      INSTABUG_PHASE_NAME = "Upload Instabug dSYM"
      INSTABUG_PHASE_SCRIPT = <<-SCRIPTEND
        # SKIP_SIMULATOR_BUILDS=1
        SCRIPT_SRC=$(find "$PROJECT_DIR" -name 'Instabug_dsym_upload.sh')
        if [ ! "${SCRIPT_SRC}" ]; then
          echo "Instabug: err: script not found. Make sure that you're including Instabug.bundle in your project directory"
          exit 1
        fi
        source "${SCRIPT_SRC}"
        SCRIPTEND

      def integrate_with_instabug!
        integrate_without_instabug!
        return if instabug_native_targets.empty?
        UI.section("Integrating with Instabug") do
          add_instabug_upload_script_phase
          user_project.save
        end
      end

      alias integrate_without_instabug! integrate!
      alias integrate! integrate_with_instabug!

      def add_instabug_upload_script_phase
        instabug_native_targets.each do |native_target|
          phase = native_target.shell_script_build_phases.select{ |bp| bp.name == INSTABUG_PHASE_NAME }.first ||
                  native_target.new_shell_script_build_phase(INSTABUG_PHASE_NAME)

          phase.shell_path = "/bin/sh"
          phase.shell_script = INSTABUG_PHASE_SCRIPT
          phase.show_env_vars_in_log = '0'
        end
      end

      def instabug_native_targets
        @instabug_native_targets ||=(
          target_uuids = target.user_target_uuids
          native_targets = target_uuids.map do |uuid|
            native_target = user_project.objects_by_uuid[uuid]
            unless native_target
              raise Informative, "[Error] Unable to find the target with " \
                "the `#{uuid}` UUID for the `#{target}` integration library"
            end
            native_target
          end

          native_targets.reject do |native_target|
            native_target.shell_script_build_phases.any? do |bp|
              bp.name == INSTABUG_PHASE_NAME && bp.shell_script == INSTABUG_PHASE_SCRIPT
            end
          end
        )
      end
    end
  end

  s.name         = "Instabug"
  s.version      = "3.4"
  s.summary      = "Bug reporting for mobile apps. Learn more at http://instabug.com"
  s.homepage     = "http://instabug.com"
  s.license      = {
      :type => 'Commercial',
      :text => <<-LICENSE
                Copyright (C) 2014 Instabug

                Permission is hereby granted to use this framework as is, modification are not allowed.

                All rights reserved.
				
				THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
				IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
				FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
				AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
				LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
				OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
				THE SOFTWARE.
      LICENSE
    }
  s.author       = { "Instabug" => "contactus@instabug.com" }
  s.platform     = :ios, '5.0'
  s.source       = { :git => "https://github.com/Instabug/Instabug-iOS.git", :tag => "3.4" }
  s.source_files = 'Instabug.framework/Versions/A/Headers/*.{h}'
  s.resources    = 'Instabug.bundle'
  s.preserve_paths =  'Instabug.framework/*', 'Instabug.bundle'
  s.frameworks   = 'QuartzCore', 'CoreGraphics', 'CoreMotion', 'CoreFoundation', 'SystemConfiguration', 'Foundation', 'AVFoundation', 'OpenGLES', 'AudioToolbox', 'GLKit', 'CoreTelephony', 'UIKit', 'CoreLocation', 'MessageUI', 'MobileCoreServices', 'Instabug'
  s.libraries    = 'c++'
  s.xcconfig     =  { 'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/Instabug/"', 'CLANG_CXX_LANGUAGE_STANDARD' => 'c++11', 'CLANG_CXX_LIBRARY' => 'libc++' }
  s.requires_arc = true
end
