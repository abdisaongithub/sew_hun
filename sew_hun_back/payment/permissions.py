from rest_framework.permissions import BasePermission


class PaidMonthlySubscription(BasePermission):

    def has_permission(self, request, view):

        return True
