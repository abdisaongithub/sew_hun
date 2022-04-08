from rest_framework.permissions import BasePermission


class OwnsComment(BasePermission):

    def has_permission(self, request, view):
        print(request.user)

        return True


class OwnsPost(BasePermission):

    def has_permission(self, request, view):
        return True
