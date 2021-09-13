from pyInovEval.logger import logger

def valError(msg):
    logger.error(msg, stack_info=True)
    raise ValueError(msg)
