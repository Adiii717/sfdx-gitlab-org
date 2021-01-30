# sfdx ci using gitlab

## Step 1

1): Make sure to create open SSL certificate for digigtal signatue

```shel
openssl genrsa -des3 -passout pass:SomePassword -out server.pass.key 2048
openssl rsa -passin pass:SomePassword -in server.pass.key -out server.key
openssl req -new -key server.key -out server.csr
openssl x509 -req -sha256 -days 365 -in server.csr -signkey server.key -out server.crt
```

2): Upload `server.crt` in your Saleforce connected App setting

3): Save `server.key` in your GitLab project environment variable `SERVER_KEY`. GitLab CI/CD [environment variables](https://gitlab.com/help/ci/variables/README#variables)

4): Create environment variable in your GitLab project for `SF_CONSUMER_KEY` and `SF_USERNAME` (username that you to use in the CI)

## Getting Started

1) Clone the repo `git clone https://github.com/Adiii717/sfdx-gitlab-org.git`

2) Build this docker image or use it from DockerHub

```shell
docker build -t adiii717/docker-sfdx-cli .
docker run adiii717/docker-sfdx-cli sfdx --help
```

If you want to run/test your local code

```shell
docker run -it --workdir=/app -v $PWD/:/app adiii717/docker-sfdx-cli
```

Now you're ready to go! Wwhen you commit and push a change, your change kicks off a GitLab CI build.

Enjoy!

## Contributing to the Repository

If you find any issues or opportunities for improving this repository, fix them! Feel free to contribute to this project by [forking](http://help.github.com/fork-a-repo/) this repository and making changes to the content. Once you've made your changes, share them back with the community by sending a pull request. See [How to send pull requests](http://help.github.com/send-pull-requests/) for more information about contributing to GitHub projects.

## Reporting Issues

If you find any issues with this demo that you can't fix, feel free to report them in the [issues](https://github.com/Adiii717/sfdx-gitlab-org/issues) section of this repository.
