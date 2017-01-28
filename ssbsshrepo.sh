cd ~/
mkdir .ssh
cd .ssh/
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

# Enter a file in which to save the key (/Users/you/.ssh/id_rsa): [Press enter]
# Enter passphrase (empty for no passphrase): [Type a passphrase]
# Enter same passphrase again: [Type passphrase again]

# start the ssh-agent in the background
eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_rsa

cat id_rsa.pub

# copy & paste to ssh account
