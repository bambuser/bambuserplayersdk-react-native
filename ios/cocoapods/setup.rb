
$bambuserplayer_post_install = -> (installer) {
    puts "Updating CocoaPods config for bambuserplayer-sdk..."

    installer.pods_project.targets.each do |target|
        # disable signing for this bundle 
        if target.product_name == "gRPCCertificates-Cpp"
          target.build_configurations.each do |config|
              config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
          end
        end
    end
}

$bambuserplayer_post_install_callbacks = []

def bambuserplayer_pod_setup(podfile)
    new_post_install = -> (&block) {
        $bambuserplayer_post_install_callbacks.append(block)
        begin 
            origin_post_install do |installer|
                $bambuserplayer_post_install_callbacks.each { |sub_block|
                    sub_block.call(installer)
                }
            end 
        rescue StandardError => error
            puts error
        end 
    }
    # Replace `post_install` method in Pod::Podfile class and save original as `origin_post_install`
    Pod::Podfile.public_send(:alias_method, :origin_post_install, :post_install)
    Pod::Podfile.define_method(:post_install) do |&block|
        new_post_install.call(&block)
    end 

    podfile.post_install(&$bambuserplayer_post_install)
end