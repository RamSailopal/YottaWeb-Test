local pegasus = require 'pegasus'
ydb = require('yottadb')
local server = pegasus:new({
          port='9090'
    })

    server:start(function (req, res)
             pat = ydb.subscript_next('^PATIENTS', {''})
             while( pat ~= nil )
             do
               id=pat
               name = ydb.get('^PATIENTS', {pat, 'name'})
               address = ydb.get('^PATIENTS', {pat, 'address'})
               sex = ydb.get('^PATIENTS', {pat, 'sex'})
               age = ydb.get('^PATIENTS', {pat, 'age'})
               pat = ydb.subscript_next('^PATIENTS', {pat})
             end
             body = '[{"id":"' .. id .. '","name":"' .. name .. '","address":"' .. address ..'","age":' .. age .. ',"sex":"' .. sex .. '}]\n'
             res:addHeader('Content-Type', 'text/html'):write(body)
        end)

