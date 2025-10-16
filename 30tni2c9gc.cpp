#include "PlayerInputHandler.h"
#include "GameFramework/SpringArmComponent.h"
#include "Camera/CameraComponent.h"
#include "Components/InputComponent.h"
#include "Engine/World.h"

// Sets default values
APlayerInputHandler::APlayerInputHandler()
{
    // Set this character to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
    PrimaryActorTick.bCanEverTick = true;

    // Create a camera boom (pulls in towards the player if there is a collision)
    CameraBoom = CreateDefaultSubobject<USpringArmComponent>(TEXT("CameraBoom"));
    CameraBoom->SetupAttachment(RootComponent);
    CameraBoom->TargetArmLength = 300.0f; // The camera follows at this distance behind the character	
    CameraBoom->bUsePawnControlRotation = true; // Rotate the arm based on the controller

    // Create a follow camera
    FollowCamera = CreateDefaultSubobject<UCameraComponent>(TEXT("FollowCamera"));
    FollowCamera->SetupAttachment(CameraBoom, USpringArmComponent::SocketName); // Attach the camera to the end of the boom
    FollowCamera->bUsePawnControlRotation = false; // Camera does not rotate relative to arm
}

// Called when the game starts or when spawned
void APlayerInputHandler::BeginPlay()
{
    Super::BeginPlay();
}

// Called every frame
void APlayerInputHandler::Tick(float DeltaTime)
{
    Super::Tick(DeltaTime);
}

// Setup input system
void APlayerInputHandler::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
    Super::SetupPlayerInputComponent(PlayerInputComponent);

    // Bind movement events
    PlayerInputComponent->BindAxis("MoveForward", this, &APlayerInputHandler::MoveForward);
    PlayerInputComponent->BindAxis("MoveRight", this, &APlayerInputHandler::MoveRight);

    // Bind look events
    PlayerInputComponent->BindAxis("LookUp", this, &APlayerInputHandler::LookUp);
    PlayerInputComponent->BindAxis("Turn", this, &APlayerInputHandler::Turn);

    // Bind action events
    PlayerInputComponent->BindAction("Jump", IE_Pressed, this, &APlayerInputHandler::JumpAction);
    PlayerInputComponent->BindAction("Fire", IE_Pressed, this, &APlayerInputHandler::FireAction);
}

// Handle forward/backward movement
void APlayerInputHandler::MoveForward(float Value)
{
    if ((Controller != nullptr) && (Value != 0.0f))
    {
        // Find out which way is forward
        const FRotator Rotation = Controller->GetControlRotation();
        const FRotator YawRotation(0, Rotation.Yaw, 0);

        // Get forward vector
        const FVector Direction = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::X);
        AddMovementInput(Direction, Value);
    }
}

// Handle right/left movement
void APlayerInputHandler::MoveRight(float Value)
{
    if ((Controller != nullptr) && (Value != 0.0f))
    {
        // Find out which way is right
        const FRotator Rotation = Controller->GetControlRotation();
        const FRotator YawRotation(0, Rotation.Yaw, 0);
    
        // Get right vector 
        const FVector Direction = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::Y);
        // Add movement in that direction
        AddMovementInput(Direction, Value);
    }
}

// Handle looking up/down
void APlayerInputHandler::LookUp(float Value)
{
    AddControllerPitchInput(Value);
}

// Handle turning left/right
void APlayerInputHandler::Turn(float Value)
{
    AddControllerYawInput(Value);
}

// Handle jump action
void APlayerInputHandler::JumpAction()
{
    Jump();
}

// Handle fire action
void APlayerInputHandler::FireAction()
{
    // Add firing logic here
    UE_LOG(LogTemp, Log, TEXT("Fire action triggered!"));
}