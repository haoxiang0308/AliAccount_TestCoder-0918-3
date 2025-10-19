#pragma once

#include "CoreMinimal.h"
#include "GameFramework/PlayerController.h"
#include "PlayerInputHandler.generated.h"

/**
 * APlayerInputHandler - Handles player input in Unreal Engine
 */
UCLASS()
class PLAYERINPUT_API APlayerInputHandler : public APlayerController
{
    GENERATED_BODY()

public:
    APlayerInputHandler();

    // Called when the game starts or when spawned
    virtual void BeginPlay() override;

    // Called every frame
    virtual void Tick(float DeltaTime) override;

    // Called to bind functionality to input
    virtual void SetupInputComponent() override;

protected:
    // Movement input functions
    void MoveForward(float Value);
    void MoveRight(float Value);

    // Look input functions
    void LookUp(float Value);
    void Turn(float Value);

    // Action input functions
    void Jump();
    void Fire();

private:
    // Input mapping context
    class UInputMappingContext* DefaultMappingContext;

    // Input action references
    class UInputAction* MoveForwardAction;
    class UInputAction* MoveRightAction;
    class UInputAction* LookUpAction;
    class UInputAction* TurnAction;
    class UInputAction* JumpAction;
    class UInputAction* FireAction;
};