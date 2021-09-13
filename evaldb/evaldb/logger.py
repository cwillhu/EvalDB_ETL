''' Set up logging to console and file '''

import logging, os
from pyInovEval.config.config import Config


logFile = Config.get('logFile')

logger = logging.getLogger('pyInovEval')
logger.setLevel(logging.DEBUG)

formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')

sh = logging.StreamHandler()
sh.setLevel(logging.DEBUG)
sh.setFormatter(formatter)

fh = logging.FileHandler(logFile)
fh.setLevel(logging.DEBUG)
fh.setFormatter(formatter)

logger.addHandler(sh)
logger.addHandler(fh)

