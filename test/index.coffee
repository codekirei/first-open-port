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

  # ----------------------------------------------------------
  # hooks
  # ----------------------------------------------------------

  beforeEach ->
    server = net.createServer()

  afterEach ->
    server.close()

  # ----------------------------------------------------------
  # cases
  # ----------------------------------------------------------

  it 'find an open port', ->
    port = yield firstOpenPort 1024
    assert.isNumber port

  # ----------------------------------------------------------

  it 'reject Promise if no open ports in range', ->
    port = yield firstOpenPort 1024
    server.listen(port)
    assert.isRejected firstOpenPort port, port
