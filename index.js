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
        else rej(new Error(`no ports open from ${start} to ${max}`))
      })
      server.on('listening', () => server.close())
      server.on('close', () => res(port))
      server.listen(port)
    })()
  })
}

module.exports = firstOpenPort
