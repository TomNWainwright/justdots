#!/usr/bin/env xonsh


def dirs_recursive(start):
    stream = $(fd --type 'd' .  @(start))
    return stream.splitlines()

def list_wrap(arg):
  if type(arg) != list:
    return [arg]
  else:
    return arg

def apt_install_list(packages, ppa = None):
  if ppa:
    for repo in list_wrap(ppa):
      $(sudo add-apt-repository -y @("ppa:" + repo))
    $(sudo apt-get update)
  for package in list_wrap(packages):
    $(sudo apt-get install -y @(package))
    
def flatten_list(nested_list):
  flat_list = []
  for sub_list in nested_list:
    for i in sub_list:
      flat_list.append(i)
  return flat_list