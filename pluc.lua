vec={}
vec.__index=vec

function vec.new(x,y)
	local o={x=x or 0,y = y or 0}
	return setmetatable(o,vec)
end

function vec.__unm(a)
	return vec.new(-a.x,-a.y)
end

function vec.__add(a,b)
	return vec.new(a.x+b.x,a.y+b.y)
end

function vec.__sub(a,b)
	return vec.new(a.x-b.x,a.y-b.y)
end

function vec.__mul(a,b)
	if type(a)=='number'then
		return vec.new(a*b.x,a*b.y)
	elseif type(b)=='number'then
		return vec.new(b*a.x,b*a.y)
	else
		return a.x*b.x+a.y*b.y
	end
end

function vec.__div(a,b)
	return vec.new(a.x/b,a.y/b)
end

function vec.__eq(a,b)
	return a.x==b.x and a.y==b.y
end

function vec:__tostring()
	return '('..tonumber(self.x)..','..
	tonumber(self.y)..')'
end