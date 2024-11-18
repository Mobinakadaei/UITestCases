from urllib.parse import urljoin
from requests import get
from robot.libraries.BuiltIn import BuiltIn
import variables

class OpenLibraryApi:
    def __init__(self):
        self.bi = BuiltIn()
        self.url = variables.URL

    def call_search_api(self, title=None, author=None):
        url = urljoin(self.url, "search.json")
        if title is None:
            params = {"author": author}
        if author is None:
            params = {"title": title}
        else:
            params = {"title": title, "author": author}
        resp = get(url=url, params=params)
        assert resp.status_code == 200, f"resp status is: {resp.status_code}, body: {resp.text}"
        self.bi.log_to_console(f'Search API Request URL is: {resp.request.url}')
        return resp.json()

    def call_edition_api_by_edition_id(self, edition_id=None):
        title = variables.BOOK_TITLE
        author = variables.AUTHOR_NAME
        if edition_id is None:
            edition_id = self.call_search_api(title, author)["docs"][0]["edition_key"][5]
        self.bi.log_to_console(f'Edition ID is: {edition_id}')
        url = urljoin(self.url, f"book/{edition_id}.json")
        resp = get(url=url)
        self.bi.log_to_console(f'Edition API Request url is: {resp.request.url}')
        assert resp.status_code == 200, f"resp status is: {resp.status_code}, body: {resp.text}"
        return resp.json()

    def call_isbn_api(self, isbn_number=None):
        title = variables.BOOK_TITLE
        author = variables.AUTHOR_NAME
        if isbn_number is None:
            isbn_number = self.call_search_api(title, author)["docs"][0]["isbn"][4]
        self.bi.log_to_console(f'ISBN Number is: {isbn_number}')
        url = urljoin(self.url, f"isbn/{isbn_number}.json")
        resp = get(url=url)
        self.bi.log_to_console(f'ISBN API Request url is: {resp.request.url}')
        assert resp.status_code == 200, f"resp status is: {resp.status_code}, body: {resp.text}"
        return resp.json()

    def get_author_data_by_author_key(self, author_key=None):
        title = variables.BOOK_TITLE
        author = variables.AUTHOR_NAME
        if author_key is None:
            author_key = (self.call_search_api(title, author)["docs"][0]["author_key"])[0]
        self.bi.log_to_console(f'Author Key Value is: {author_key}')
        url = urljoin(self.url, f"authors/{author_key}.json")
        resp = get(url=url)
        self.bi.log_to_console(f'Author Data Request url is: {resp.request.url}')
        assert resp.status_code == 200, f"resp status is: {resp.status_code}, body: {resp.text}"
        return resp.json()





