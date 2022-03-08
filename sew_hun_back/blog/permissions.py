from rest_framework.permissions import BasePermission


class OwnsComment(BasePermission):

    def has_permission(self, request, view):
        return True
