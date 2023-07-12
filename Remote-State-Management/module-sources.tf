module "demomodule" {
  source = "git::https://github.com/zealvora/tmp-repo.git"
}

module "demomodule" {
                                            #ref = branch name in git the you are referencing 
  source = "git::https://github.com/zealvora/tmp-repo.git?ref=development"
}