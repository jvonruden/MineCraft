term.clear()
term.setTextColor( colors.green )
term.setCursorPos(1,1)

local content = [[

NOS Fuel is freely available to all who wish to use it.
We have setup endertanks for both input and output.
To use the fuel, simply craft an ender tank with the desired
color codes (see below).

How can I contribute?

Of course, these resources are are not unlimited. Specifically oil.
If you wish to help, use the color codes below to contribute oil, saplings
etc...


]]

textutils.pagedPrint(content)

local event, key = os.pullEvent( "key" )
