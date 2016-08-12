require 'tempfile'

if ENV["DOCKER_CERT"].present?
  tmp_dir = "#{Rails.root}/tmp"
  cert_file = Tempfile.new "docker_cert", tmp_dir
  cert_file.write(ENV["DOCKER_CERT"].gsub('\\n',"\n"))
  cert_file.close

  key_file = Tempfile.new "docker_key", tmp_dir
  key_file.write(ENV["DOCKER_KEY"].gsub('\\n',"\n"))
  key_file.close

  ca_file = Tempfile.new "docker_ca", tmp_dir
  ca_file.write(ENV["DOCKER_CA"].gsub('\\n',"\n"))
  ca_file.close

  DOCKER_KEYS=[ca_file, key_file, cert_file]

  Docker.options = {
    client_cert: cert_file.path,
    client_key: key_file.path,
    ssl_ca_file: ca_file.path,
    scheme: 'https'
  }
end
