CREATE TABLE [dbo].[DelivererAvailability]
(
    [DelivererId] INT NOT NULL, 
    [AvailabilityId] INT NOT NULL, 
    CONSTRAINT [PK_DelivererAvailability] PRIMARY KEY ([AvailabilityId], [DelivererId]), 
    CONSTRAINT [FK_DelivererAvailability_ToDeliverer] FOREIGN KEY ([DelivererId]) REFERENCES [Deliverer]([Id]), 
    CONSTRAINT [FK_DelivererAvailability_ToAvailability] FOREIGN KEY ([AvailabilityId]) REFERENCES [Availability]([Id])
)
