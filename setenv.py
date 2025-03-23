import os
import getpass

aws_access_key = input("Enter AWS Access Key ID: ")
aws_secret_key = getpass.getpass("Enter AWS Secret Access Key: ")
aws_session_token = getpass.getpass("Enter AWS Session Token (if applicable): ")

os.environ["AWS_ACCESS_KEY_ID"] = aws_access_key
os.environ["AWS_SECRET_ACCESS_KEY"] = aws_secret_key
os.environ["AWS_SESSION_TOKEN"] = aws_session_token

print("\nAWS credentials set successfully for this session!")

print(f'\nRun the following command in your shell to set AWS credentials:')
print(f'Linux/macOS: export AWS_ACCESS_KEY_ID="{aws_access_key}" AWS_SECRET_ACCESS_KEY="{aws_secret_key}" AWS_SESSION_TOKEN="{aws_session_token}"')
print()
print(f'Windows (PowerShell): $env:AWS_ACCESS_KEY_ID="{aws_access_key}"; $env:AWS_SECRET_ACCESS_KEY="{aws_secret_key}"; $env:AWS_SESSION_TOKEN="{aws_session_token}"')