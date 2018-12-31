-- vector class
-- adapted from https://github.com/vrld/hump/blob/master/vector.lua
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

function vec:to_str()
	return '('..self.x..','..
	self.y..')'
end

function vec:len()
	return sqrt(self.x*self.x+self.y*self.y)
end

function vec:dist(b)
	local dx=self.x-b.x
	local dy=self.y-b.y
	return sqrt(dx*dx+dy*dy)
end

function vec:clone()
	return vec.new(self.x,self.y)
end

function vec:normi()
	local l=self:len()
	if l>0 then
		self.x,self.y=self.x/l,self.y/l
	end
	return self
end

function vec:norm()
	return self:clone():normi()
end

-- timer class
timer={}
timer.__index=timer

function timer.new(ti,fi)
	local o={ti=ti or 0,fi=fi or 1,
	t=0,f=0,done=true}
	return setmetatable(o,timer)
end

function timer:update()
 if not self.done then
 	if self.f==0 then
 		self.t-=1
 		self.f=self.fi
 	else
 		self.f-=1
 	end
 	
 	if(self.t==0) self.done=true
 end
 
 return self.t
end

function timer:reset()
	self.done=false
	self.t=self.ti
	self.f=self.fi
	return self.t
end

function timer:pause()
	self.done=true
end

function timer:resume()
	if(self.t!=0)self.done=false
end