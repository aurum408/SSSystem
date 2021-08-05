import time

from lxml import etree


def parse_categories_page(content: str) -> dict:
    parser = etree.HTMLParser()
    tree = etree.fromstring(content, parser, )

    next_href = tree.find(".//li[@class='a-last']/a").get("href", None)
    boxes = tree.findall(".//div[@data-component-type='s-search-result']")
    boxes = list(map(lambda x: x.find(".//a[@class='a-link-normal a-text-normal']"), boxes))
    items = list(map(lambda x: {"_id":x.get("data-asin", None),
                                "href": x.get("href", None)}, boxes))

    content = {"next": next_href, "items": items}
    return content


def time_it(method, *args, **kwargs):
    t0 = time.time()
    method(*args, **kwargs)
    dt = time.time() - t0
    print(dt * 1000, " milliseconds")