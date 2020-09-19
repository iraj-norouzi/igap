export GMAIL_ACCOUNT=useriraj2000@gmail.com # Substitute in your full gmail address here.
echo  'GMAIL_ACCOUNT=useriraj2000@gmail.com' >> /root/.bashrc
echo  'GMAIL_AUTH_TOKEN=ir@j283580'        >> /root/.bashrc
export GMAIL_AUTH_TOKEN=ir@j283580        # Substitute in your app password

cat <<EOF > config.yml
route:
  group_by: [Alertname]
  # Send all notifications to me.
  receiver: email-me

receivers:
- name: email-me
  email_configs:
  - to: $GMAIL_ACCOUNT
    from: $GMAIL_ACCOUNT
    smarthost: smtp.gmail.com:587
    auth_username: "$GMAIL_ACCOUNT"
    auth_identity: "$GMAIL_ACCOUNT"
    auth_password: "$GMAIL_AUTH_TOKEN"
EOF
