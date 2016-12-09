

function love.load()
  player = {}
  player.x = 100
  player.bullets = {}
  player.fire = function()
    bullet = {}
    bullet.x = player.x+40
    bullet.y = 400
    table.insert(player.bullets,bullet)
  end
end

function love.update(dt)
  unit = dt*100
  if love.keyboard.isDown('right') then
    player.x = player.x + unit
  elseif love.keyboard.isDown('left') then
    player.x = player.x - unit
  end

  if love.keyboard.isDown("space") then
    player.fire()
  end
end

function love.draw()
  -- Print Love2D versoin
  local major, minor, revision, codename = love.getVersion()
  local str = string.format("Version %d.%d.%d - %s", major, minor, revision, codename)
  love.graphics.print(str, 20, 20)

  
  love.graphics.rectangle('fill',player.x,400,80,20)
  for _,v in pairs(player.bullets) do
    love.graphics.rectangle('fill',v.x,v.y,10,10)
    v.y = v.y - 10
  end
end


