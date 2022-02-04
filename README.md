# Build & Deploy react application image to AWS ECR

## Package manager

`yarn`

## Commands

### Run Test

Create-react-app has set all the babel, webpack and jest for development, build and test.

- Run unit test

```
yarn test
```

## Test set up problems

CRA has own set up on jest and configured with babel, webpack and allow us to use third-party dependency to do snapshot testing.

### Problem

- Can only use limited jest options in package.json
- Options does not support --config
- To use custom jest setup, we have to either use eject or append `-- --config=<config path>`, which the
  later option breaks the CRA set up and cause `snapshot testing not working`

```json
"jest": {
	...
}
```
