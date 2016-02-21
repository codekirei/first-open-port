'use strict'

const net = require('net')
const Promise = require('bluebird')

function firstOpenPort(port, max) {
  const start = port
  max = max || 65535

  return new Promise((res, rej) => {
    (function test() {
      const server = net.createServer()
      server.on('error', () => {
        if ((port += 1) <= max) test(port)
        else rej(new Error(`no open ports from ${start} to ${max}`))
      })
      server.on('close', () => res(port))
      server.listen(port, err => {
        if (!err) server.close()
      })
    })()
  })
}

module.exports = firstOpenPort
