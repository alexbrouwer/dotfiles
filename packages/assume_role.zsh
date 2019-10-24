# =======================================
# Assume role
# =======================================
# See https://github.com/coinbase/assume-role/blob/master/assume-role

#export AWS_PROFILE_ASSUME_ROLE="default"
#export AWS_USERNAME="alex"
export AWS_ROLE_SESSION_TIMEOUT=3600
export AWS_ROLE_SESSION_WARNING=300

alias assume-role='function(){eval $(command assume-role $@);}'