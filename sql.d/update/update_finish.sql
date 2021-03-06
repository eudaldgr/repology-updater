-- Copyright (C) 2016-2019 Dmitry Marakasov <amdmi3@amdmi3.ru>
--
-- This file is part of repology
--
-- repology is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- repology is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with repology.  If not, see <http://www.gnu.org/licenses/>.

--------------------------------------------------------------------------------
-- Hack: avoid sequence overflows (especially for repositories table)
--------------------------------------------------------------------------------
-- XXX: this one is not really helpful currently as packages are INSERTed, not UPSERTed
-- if packages id overflow becomes problem, we may enable CYCLE on packages id sequence
--SELECT setval(pg_get_serial_sequence('packages', 'id'), (select max(id) + 1 FROM packages));
SELECT setval(pg_get_serial_sequence('metapackages', 'id'), (select max(id) + 1 FROM metapackages));
SELECT setval(pg_get_serial_sequence('maintainers', 'id'), (select max(id) + 1 FROM maintainers));
