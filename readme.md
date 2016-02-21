# `first-open-port`

[![Build Status][1]][2]
[![Coverage Status][3]][4]

---

<b>[About](#about)</b> | 
<b>[Installation](#installation)</b> | 
<b>[Usage](#usage)</b> | 
<b>[License](#license)</b>

## About

A tiny Node.js module to get the first available port on `localhost` in a given range.
Handy for avoiding hard-coded port conflicts (`EADDRINUSE`) if you frequently spin up more than one local server during development.
Returns a Promise.

## Installation

Install and require as a standard Node module.

**Install**

```
  $ npm install --save first-open-port
```

**Require**

```js
  var firstOpenPort = require('first-open-port')
```

## Usage

`firstOpenPort(start, max)`

- **start** : *Number* : begin search at this port
- (**max**) : *Number* : optional last port to search before rejecting

Returns a `bluebird` Promise that resolves with the first open port or rejects with an error if no open ports are found in the given range.

```js
var firstOpenPort = require('first-open-port')

firstOpenPort(3000, 3100)
  .then(port => {
    // start a server on that port
  })
  .catch(err => {
    // do something when no ports are available
  })

```

## License

[MIT](https://github.com/codekirei/first-open-port/blob/master/license)

[1]: https://img.shields.io/travis/codekirei/first-open-port.svg?style=flat-square
[2]: https://travis-ci.org/codekirei/first-open-port
[3]: http://img.shields.io/coveralls/codekirei/first-open-port.svg?style=flat-square
[4]: https://coveralls.io/github/codekirei/first-open-port?branch=master
