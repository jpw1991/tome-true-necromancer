-- ToME - Tales of Maj'Eyal
-- Copyright (C) 2009 - 2016 Nicolas Casalini
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
--
-- Nicolas Casalini "DarkGod"
-- darkgod@te4.org

-- Better Summoning for Necromancy
long_name = "True Necromancer"
short_name = "truenecromancer" -- Determines the name of your addon's file.
for_module = "tome"
version = {1,4,6}
addon_version = {1,0,0}
weight = 100 -- The lower this value, the sooner your addon will load compared to other addons.
author = {'jpw1991@gmail.com'}
homepage = 'https://github.com/jpw1991/tome-true-necromancer'
description = [[Adds a new necromancer class with better summoning.]]
tags = {'better', 'summoning', 'necromancy', 'necromancer'} -- tags MUST immediately follow description

overload = false
superload = true
data = true
hooks = true
