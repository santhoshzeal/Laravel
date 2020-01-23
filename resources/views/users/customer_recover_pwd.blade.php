@extends('layoutslogin.default')

@section('content')
<div style="width:100vw">
	<div class="row">
	<div class="col-md-12 pb-0" style="background-color:#4d5467">
		<div class="card-body pb-0">
			<h4 class="text-white mb-5">Change Password</h4>
		</div>
	</div>
	</div>
    <div class="row">
        <div class="col-sm-0 col-md-1 col-lg-2"></div>
        <div class="col-sm-12 col-md-10 col-lg-8 card">
            <div class="card-body pl-0 pr-0">
                <h5 class="mt-0 pl-3"> Change Password </h5>
                <hr />
                <div class="row p0 m-0">
         {!! Form::open(array('id'=>'createCustomerForm','name'=>'createCustomerForm','method' => 'post', 'url' => url('customerpwdstore'), 'class' => 'createCustomerForm col-sm-12 card p-2','files' => true)) !!}
                    					    
                        <div class="row">
                            <div class="col-12">
                                <div class="card m-b-30">
                                    <div class="card-body">
									
										<div class="form-group row">
											<label class="block clearfix">
											<span class="block input-icon input-icon-right">
												<span id="msg"></span>
											</span>
											</label>
										</div>
									  
									  <input type="hidden" name="id" id="id" value="{{ old('id', !empty($getUserLists) ? $getUserLists->id : '') }}" />
								
									   <div class="form-group">
										<label class="col-lg-3 control-label">Password:</label>
										<div class="col-lg-9">
											<input type="password" class="form-control" placeholder="Password" name="password" id="password" required>
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-3 control-label">Confirm Password:</label>
										<div class="col-lg-9">
											<input type="password" class="form-control" placeholder="Confirm Password" name="repeat_password" id="repeat_password" required>
										</div>
									</div>                              

									<div class="text-right">
										<button type="submit" name="submitCusPwd" class="btn btn-primary">Submit form <i class="icon-arrow-right14 position-right"></i></button>
									</div>
								
								
                                    </div>
                                </div>
                            </div> <!-- end col -->
                        </div> <!-- end row -->
                    </form>
                </div>
            </div>
            <!-- </div> -->
        </div>
    </div>
</div>


<script type='text/javascript'>

</script>


@endsection