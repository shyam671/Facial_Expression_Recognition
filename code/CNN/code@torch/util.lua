#!/usr/bin/env lua
require 'torch'
require 'image'
require 'xlua'
local util = torch.class('util')


function util:printr()
	print ("Make Tech Easier!")
	end

function util:load_data(filename)
	op = xlua.OptionParser('load-images.lua [options]')
	op:option{'-d', '--dir', action='store', dest='dir', help='directory to load', req=true}
        op:option{'-e', '--ext', action='store', dest='ext', help='only load files of this extension', default='jpg'}
	opt = op:parse()
        op:summarize()

	opt.dir = filename

	local files = {}

	for file in paths.files(opt.dir) do
	  if file:find(opt.ext .. '$') then
	-- and insert the ones we care about in our table
            table.insert(files, paths.concat(opt.dir,file))
	  end
	end

        table.sort(files, function (a,b) return a < b end)

	local images = {}

	for i,file in ipairs(files) do
	-- load each image
        local img = image.load(file)
        --img = image.scale(img,28,28)
        table.insert(images,img)
           -- table.insert(images, image.load(file))
	end
        
        local img_num = #images
        local mat = torch.Tensor(img_num,48,48)
        for i = 1,img_num do
          mat[{{i}}] = images[i]
        end
	return mat;
end
