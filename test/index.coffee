# ----------------------------------------------------------
# modules
# ----------------------------------------------------------

chai           = require 'chai'
chaiAsPromised = require 'chai-as-promised'
firstOpenPort  = require '..'
net            = require 'net'

# ----------------------------------------------------------
# assertions
# ----------------------------------------------------------

chai.use(chaiAsPromised)
assert = chai.assert

# ----------------------------------------------------------
# tests
# ----------------------------------------------------------

describe 'first open port', ->

  # ----------------------------------------------------------
  # shared
  # ----------------------------------------------------------

  server = undefined
  port = undefined

  # ----------------------------------------------------------
  # hooks
  # ----------------------------------------------------------

  before ->
    server = net.createServer()
    port = yield firstOpenPort 1024
    server.listen(port)

  after ->
    server.close()

  # ----------------------------------------------------------
  # cases
  # ----------------------------------------------------------

  it 'return port number', ->
    assert.isNumber port

  # ----------------------------------------------------------

  it 'iteratively find an open port', ->
    assert.notEqual port, yield firstOpenPort 1024

  # ----------------------------------------------------------

  it 'reject Promise if no open ports in range', ->
    assert.isRejected firstOpenPort port, port
