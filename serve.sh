# use force_polling to work when we're running in a VM on a shared folder from the host -- file system notifications don't seem to happen like they should
bundle exec jekyll serve --watch --force_polling
