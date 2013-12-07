# -*- encoding: utf-8 -*-

require File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name = 'ztree-rails'
  s.version = '0.0.1'
  s.authors = ['Zhimeng Sun']
  s.email = ['zhimengSun@gmail.com']
  s.homepage = 'https://github.com/zhimengSun/ztree-rails'
  s.summary = 'ztree for rails, Extractive common action and helper'
  s.description = 'ztree for rails, Extractive common action and helper'

  s.files = `git ls-files`.split("\n")

  s.add_dependency "jquery-rails"
end
