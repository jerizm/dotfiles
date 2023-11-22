fd -t f -e ts --exec sd '// @ts.*\n' ''
fd -t f -e ts --exec sd 'import ([\w]+)' 'import * as $1'
fd -t f -e ts --exec sd 'import \* as config' 'import config'
fd -t f -e ts --exec sd 'import \* as logger' 'import logger'
fd -t f -e ts --exec sd 'import \* as chai' 'import chai'
fd -t f -e ts --exec sd 'import \* as sinon' 'import sinon'
fd -t f -e ts --exec sd 'import \* as Joi' 'import Joi'
fd -t f -e ts --exec sd 'import \* as AWS' 'import AWS'
fd -t f -e ts --exec sd 'import \* as needle' 'import needle'
fd -t f -e ts --exec sd 'import \* as pino' 'import pino'
fd -t f -e ts --exec sd "\.js'" "'"