require "simplecov"

Pathname.new(__dir__).join("..", "coverage").tap do |cov|
  # clear old coverage results
  FileUtils.rm_rf cov if cov.exist?
end

SimpleCov.start
