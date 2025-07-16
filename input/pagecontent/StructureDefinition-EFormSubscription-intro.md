## Search Parameters

### Standard FHIR Search Parameters

This profile supports all standard Subscription search parameters:

| Name | Type | Description |
|------|------|-------------|
| `contact` | token | Contact details for the subscription |
| `criteria` | string | The search rules used to determine when to send a notification |
| `payload` | token | The mime-type of the notification payload |
| `status` | token | The current state of the subscription |
| `type` | token | The type of channel for the sent notifications |
| `url` | uri | The uri that will receive the notifications |

### Usage Examples

```
GET [base]/Subscription?status=active
GET [base]/Subscription?type=rest-hook
GET [base]/Subscription?criteria=Task?status=completed
GET [base]/Subscription?contact=System/notification-service
```

## Implementation Notes

### eForms Subscription Context
- Enables real-time notifications for form workflow events
- May subscribe to Task status changes (e.g., when forms are completed)
- Can notify external systems when ServiceRequests are created

### Security Considerations
- Should use appropriate criteria to filter relevant events
- Consider security implications for webhook endpoints
- Implement proper authentication for notification delivery