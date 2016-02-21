'use strict'

const net = require('net')
const Promise = require('bluebird')

function firstOpenPort(port, max) {
  max = max || 65535
  const err = `no ports open from ${port} to ${max}`

  return new Promise((res, rej) =>
    (function test() {
      const server = net.createServer()
      server.on('error', () => {
        if ((port += 1) <= max) test()
        else rej(new Error(err))
      })
      server.on('listening', server.close)
      server.on('close', () => res(port))
      server.listen(port)
    })()
  )
}

module.exports = firstOpenPort
