# -*- coding: utf-8 -*-
import os
import json
import argparse
from github import Github
from github.GithubException import GithubException, BadCredentialsException


def comment_pr(repo_token, filename):
    file = open(filename, encoding='utf-8')
    message = file.read()
    message = message.encode("ascii", "ignore").decode('utf-8')

    try:
        g = Github(repo_token)
        repo = g.get_repo(os.getenv('GITHUB_REPOSITORY'))
        event_payload = open(os.getenv('GITHUB_EVENT_PATH')).read()
        json_payload =  json.loads(event_payload)
        if json_payload.get('number') is not None:
            pr = repo.get_pull(json_payload.get('number'))
            pr.create_issue_comment("```" + message + "```")
        else:
            print("PR comment not supported on current event")
    # add this since github actions permission degraded when triggering from forked repo
    except GithubException as ge:
        print("Resource not accessible by integration")
        print(ge.args)
    except BadCredentialsException as bce:
        print("Bad Credentials")
        print(bce.args)
    finally:
        print(message)
    return True


if __name__ == '__main__':
    parser = argparse.ArgumentParser(allow_abbrev=False)
    parser.add_argument('--log_filename', action = 'store', type = str, required = True)
    parser.add_argument('--repo_token', action = 'store', type=str, required = True)
    args = parser.parse_args()
    comment_pr(args.repo_token, args.log_filename)