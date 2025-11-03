#include "PlayerInputHandler.h"
#include "Components/InputComponent.h"
#include "EnhancedInputComponent.h"
#include "EnhancedInputSubsystems.h"
#include "InputActionValue.h"
#include "Engine/World.h"

APlayerInputHandler::APlayerInputHandler()
{
    PrimaryActorTick.bCanEverTick = true;
}

void APlayerInputHandler::BeginPlay()
{
    Super::BeginPlay();

    // Add input mapping context
    if (APlayerController* PlayerController = Cast<APlayerController>(Controller))
    {
        if (UEnhancedInputLocalPlayerSubsystem* Subsystem = ULocalPlayer::GetSubsystem<UEnhancedInputLocalPlayerSubsystem>(PlayerController->GetLocalPlayer()))
        {
            Subsystem->AddMappingContext(DefaultMappingContext, 0);
        }
    }
}

void APlayerInputHandler::Tick(float DeltaTime)
{
    Super::Tick(DeltaTime);
}

void APlayerInputHandler::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
    Super::SetupPlayerInputComponent(PlayerInputComponent);

    // Cast to EnhancedInputComponent
    if (UEnhancedInputComponent* EnhancedInputComponent = Cast<UEnhancedInputComponent>(PlayerInputComponent))
    {
        // Binding input actions
        EnhancedInputComponent->BindAction(MoveForwardAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::MoveForward);
        EnhancedInputComponent->BindAction(MoveRightAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::MoveRight);
        EnhancedInputComponent->BindAction(LookUpAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::LookUp);
        EnhancedInputComponent->BindAction(TurnAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::Turn);
        EnhancedInputComponent->BindAction(JumpActionInput, ETriggerEvent::Started, this, &APlayerInputHandler::JumpAction);
        EnhancedInputComponent->BindAction(FireActionInput, ETriggerEvent::Started, this, &APlayerInputHandler::FireAction);
    }
}

void APlayerInputHandler::MoveForward(float Value)
{
    if (Controller && Value != 0.0f)
    {
        const FRotator Rotation = Controller->GetControlRotation();
        const FRotator YawRotation(0, Rotation.Yaw, 0);

        const FVector Direction = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::X);
        AddMovementInput(Direction, Value);
    }
}

void APlayerInputHandler::MoveRight(float Value)
{
    if (Controller && Value != 0.0f)
    {
        const FRotator Rotation = Controller->GetControlRotation();
        const FRotator YawRotation(0, Rotation.Yaw, 0);

        const FVector Direction = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::Y);
        AddMovementInput(Direction, Value);
    }
}

void APlayerInputHandler::LookUp(float Value)
{
    AddControllerPitchInput(Value);
}

void APlayerInputHandler::Turn(float Value)
{
    AddControllerYawInput(Value);
}

void APlayerInputHandler::JumpAction()
{
    Jump();
}

void APlayerInputHandler::FireAction()
{
    // Add custom firing logic here
    UE_LOG(LogTemp, Warning, TEXT("Fire action triggered!"));
}