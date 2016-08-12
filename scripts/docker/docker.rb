require 'docker'


image = Docker::Image.create("fromImage" => "#{target}:latest").tag("repo" => "pg")
container = Docker::Container.create('Cmd' => ['ls'], "Image" => "pg", "Tty" => true)
container.start
