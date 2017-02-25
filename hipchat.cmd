#!cmd alpine bash curl
#!/bin/bash

: ${HIPCHAT_TOKEN:?required}
: ${HIPCHAT_ROOM:?required room id or name}


getMessage() {
  cat <<EOF
{
  "from": "$USER",
  "message_format": "${HIPCHAT_MSG_FORMAT:=text}",
  "color": "${HIPCHAT_MSG_COLOR:=green}",
  "message": "$(cat | while read line;do echo -n $line \\n;done )"
}
EOF

}

[[ "$TRACE" ]] && set -x

curl -s \
  -H "Content-type: application/json" \
  -H "Authorization: Bearer $HIPCHAT_TOKEN" \
  api.hipchat.com/v2/room/bottest/message \
  -d "$(getMessage)"

