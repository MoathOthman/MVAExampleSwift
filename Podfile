# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'MVAExample' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!
    # Pods for MVAExample
    pod 'ObjectMapper'
    pod 'Toast-Swift'
    pod 'SDWebImage'
    pod 'SnapKit'
    target 'MVAExampleTests' do
        inherit! :search_paths
        # Pods for testing
        pod 'Nimble'
        pod 'Mockingjay'
        pod 'ObjectMapper'
    end
    
    target 'play' do
        pod 'ObjectMapper'
        pod 'Toast-Swift'
        pod 'SDWebImage'
        pod 'SnapKit'
    end
end

post_install do |installer|
    
    installer.pods_project.build_configurations.each do |config|
        config.build_settings.delete('CODE_SIGNING_ALLOWED')
        config.build_settings.delete('CODE_SIGNING_REQUIRED')
    end
    
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['CONFIGURATION_BUILD_DIR'] = '$PODS_CONFIGURATION_BUILD_DIR'
        end
    end
end
