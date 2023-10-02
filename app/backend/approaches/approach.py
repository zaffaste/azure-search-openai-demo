from abc import ABC, abstractmethod
from typing import Any

from core.authentication import AuthenticationHelper


class Approach(ABC):
    def build_filter(self, overrides: dict[str, Any], auth_claims: dict[str, Any]) -> str:
        exclude_category = overrides.get("exclude_category") or None
        security_filter = AuthenticationHelper.build_security_filters(overrides, auth_claims)
        filters = []
        if exclude_category:
            filters.append("category ne '{}'".format(exclude_category.replace("'", "''")))
        if security_filter:
            filters.append(security_filter)
        return None if len(filters) == 0 else " and ".join(filters)


class AskApproach(Approach):
    @abstractmethod
    async def run(self, q: str, overrides: dict[str, Any], auth_claims: dict[str, Any]) -> dict[str, Any]:
        ...
