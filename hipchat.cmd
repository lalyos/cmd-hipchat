#!cmd alpine bash curl
#!/bin/bash

[[ "$TRACE" ]] && set -x

debug() {
  [[ "$DEBUG" ]] && echo "-----> $*" 1>&2
}

json_message() {
  cat <<EOF
{
  "from": "$USER",
  "message_format": "${HIPCHAT_MSG_FORMAT:=text}",
  "color": "${HIPCHAT_MSG_COLOR:=green}",
  "message": "$(cat | while read line;do echo -n $line \\n;done )"
}
EOF
}

hipchat_msg() {
  declare desc="Sends a text/html notification to a Hipchat room"

  debug "$desc"
  curl -s \
      -H "Content-type: application/json" \
      -H "Authorization: Bearer $HIPCHAT_TOKEN" \
      api.hipchat.com/v2/room/bottest/message \
      -d "$(json_message)"
}

main() {
  : ${HIPCHAT_TOKEN:?required}
  : ${HIPCHAT_ROOM:?required room id or name}
  
  hipchat_msg
}

[[ "$0" == "$BASH_SOURCE" ]] && main "$@"

