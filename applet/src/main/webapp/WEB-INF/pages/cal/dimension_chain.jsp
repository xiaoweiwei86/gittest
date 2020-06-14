<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../public.jsp"/>

<section id="content_wrapper">
    <!-- Begin: Content -->
    <section id="content">
        <!-- begin: .tray-center -->
        <div class="tray tray-center" style="width: 90%;margin: auto">
            <!-- Begin: Content Header -->
            <div class="content-header">
                <h2>尺寸链计算</h2>
                <p class="lead">
                </p>
            </div>
            <div class="panel panel-primary">
                <div class="panel-heading">标题</div>
                <div class="panel heading-border">
                    <div class="panel-body bg-light">
                        <div class="section">
                            <div class="col-md-6">
                                <label for="part_number"
                                       class="field-label text fs14 mb10">产品型号：</label>
                                <label for="part_number" class="field prepend-icon">
                                    <input id="part_number" name="part_number" class="form-control"
                                           placeholder="例如：E203-3441010" style="width: 160%"/>
                                </label>

                            </div>
                            <div class="col-md-6">
                                <label for="cal_number"
                                       class="field-label text fs14 mb10">计算名称：</label>
                                <label for="cal_number" class="field prepend-icon">
                                    <input id="cal_number" name="part_number" class="form-control"
                                           placeholder="例如：臂轴与锁紧螺母的距离" style="width: 160%"/>
                                </label>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-primary">
                <div class="panel-heading">输入项</div>
                <div class="panel heading-border">
                    <div class="section" style="text-align:center;padding-top: 10px;">
                        <img class="img" src="" id="show">
                    </div>
                    <div class="section row">
                        <div class="section" style="text-align:right;width: 99%;" id="upload_img">
                            <div class="col-md-12">
                                <input type="file" name="file" id="file"
                                       accept="image/png, image/jpeg, image/gif, image/jpg,image/bmp"
                                       class="inputFile"
                                       onchange="changepic(this)"/>
                                <label for="file" class='btn btn-primary'>上传图片</label>
                            </div>
                        </div>
                    </div>
                    <form id="admin-form" name="addForm" action="" method="post">
                        <div class="panel-body bg-light">
                            <%--<div class="section row" id="part_input">
                                <div class="col-md-3">
                                    <label class="field prepend-icon">
                                        <input type="text"  class="form-control"
                                               placeholder="尺寸部位..." style="width: 140%;">
                                    </label>
                                </div>
                            </div>--%>
                            <div class="section row" id="items">
                                <div class="section text-align:center;">
                                    <%-- <div class="col-md-1">
                                         <label for="add_0"
                                                class="field-label text fs14 mb10">增环：</label>
                                         <label for="add_0" class="field prepend-icon">
                                             <input name="loop" id="add_0" type="radio" onclick="loop(this.value)" value="add" checked="checked"/>
                                         </label>
                                     </div>
                                     <div class="col-md-1">
                                         <label for="minus_0"
                                                class="field-label text fs14 mb10">减环：</label>
                                         <label for="minus_0" class="field prepend-icon">
                                             <input name="loop" id="minus_0" type="radio" onclick="loop(this.value)" value="minus"/>
                                         </label>
                                     </div>
                                     <div class="col-md-2">
                                         <label for="loop_0"
                                                class="field-label text fs14 mb10"> </label>
                                         <label for="loop_0" class="field prepend-icon" >
                                             <input id="loop_0" type="hidden"  class="form-control" />
                                         </label>
                                     </div>--%>
                                    <div class="col-md-12">
                                        <label for="description_0"
                                               class="field-label text fs14 mb10">零件/属性尺寸描述：</label>
                                        <label for="description_0" class="field prepend-icon">
                                            <input type="text" id="description_0" class="form-control"
                                                   placeholder="例如：转向螺杆/例如：全长" style="width: 140%;">
                                        </label>
                                    </div>

                                    <div class="col-md-4">
                                        <label for="nominal_value_0"
                                               class="field-label text fs14 mb10">基本值：</label>
                                        <label for="nominal_value_0" class="field prepend-icon">
                                            <input id="nominal_value_0" name="nominal_value" class="form-control"
                                                   placeholder="基本值...">
                                        </label>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="upper_deviation_0"
                                               class="field-label text fs14 mb10">上偏差：</label>
                                        <label for="upper_deviation_0" class="field prepend-icon">
                                            <input id="upper_deviation_0" name="upper_deviation"
                                                   class="form-control"
                                                   placeholder="请输入正负号..."/>
                                        </label>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="lower_deviation_0"
                                               class="field-label text fs14 mb10">下偏差：</label>
                                        <label for="lower_deviation_0" class="field prepend-icon">
                                            <input id="lower_deviation_0" name="lower_deviation"
                                                   class="form-control"
                                                   placeholder="请输入正负号..."/>
                                        </label>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="max_0"
                                               class="field-label text fs14 mb10">最大值：</label>
                                        <label for="max_0" class="field prepend-icon">
                                            <input id="max_0" name="max" class="form-control"
                                                   placeholder="最大值..."/>
                                        </label>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="min_0"
                                               class="field-label text fs14 mb10">最小值：</label>
                                        <label for="min_0" class="field prepend-icon">
                                            <input id="min_0" name="min" class="form-control"
                                                   placeholder="最小值..."/>
                                        </label>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="tol_0"
                                               class="field-label text fs14 mb10">公&nbsp;&nbsp;&nbsp;&nbsp;差：</label>
                                        <label for="tol_0" class="field prepend-icon">
                                            <input id="tol_0" name="tol" class="form-control"
                                                   placeholder="公差..."/>
                                        </label>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="mean_0"
                                               class="field-label text fs14 mb10">平均值：</label>
                                        <label for="mean_0" class="field prepend-icon">
                                            <input id="mean_0" name="mean" class="form-control"
                                                   placeholder="平均值..."/>
                                        </label>
                                    </div>

                                    <div class="col-md-4">
                                        <label for="mean_0"
                                               class="field-label text fs14 mb10">公差的平方：</label>
                                        <label for="square_tol_0" class="field prepend-icon">
                                            <input id="square_tol_0" name="square_tol" class="form-control"
                                                   placeholder="公差的平方..." disabled="disabled"/>
                                        </label>
                                    </div>
                                    <div class="col-md-12">
                                        <hr class="simple" color="#6f5499"/>
                                    </div>
                                    <div class="col-md-12" style="text-align:right;" id="close">
                                        <button type="button" class="close" aria-label="Close"><span
                                                aria-hidden="true">&times;</span></button>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="section row">
                            <%--<div class="section" style="text-align:left;width: 99%;">
                                <div class="col-md-6">
                                    &nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="addInput">
                                    +
                                </button>
                                </div>
                            </div>--%>
                            <div class="section" style="text-align:right;width: 99%;" id="addItem">
                                <div class="col-md-12">
                                    <button type="button" class="btn btn-primary" id="addItemButton"> +
                                    </button>
                                </div>
                            </div>
                        </div>

                        <div class="panel-footer text-right" id="reset">
                            <button type="reset" class="btn btn-primary" onclick="cal()">重置</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="panel panel-primary">
                <div class="panel-heading">输出项</div>
                <div class="panel heading-border">
                    <div class="panel-body bg-light">
                        <div class="section row">
                            <div class="panel panel-default ">
                                <div class="panel-heading " style="height:40px;line-height:39px;">极值法</div>
                                <div class="panel heading-border">
                                    <div class="panel-body bg-light">
                                        <div class="section">
                                            <div class="col-md-6">
                                                <label for="total_max"
                                                       class="field-label text fs14 mb10">最大极限尺寸：</label>
                                                <label for="total_max" class="field prepend-icon">
                                                    <input id="total_max" name="total_max" class="form-control"
                                                           disabled="disabled"/>
                                                </label>
                                            </div>
                                            <div class="col-md-6">
                                                <label for="total_tol"
                                                       class="field-label text fs14 mb10">极限公差：</label>
                                                <label for="total_tol" class="field prepend-icon">
                                                    <input id="total_tol" name="total_tol" class="form-control"
                                                           disabled="disabled"/>
                                                </label>
                                            </div>
                                            <div class="col-md-6">
                                                <label for="total_min"
                                                       class="field-label text fs14 mb10">最小极限尺寸：</label>
                                                <label for="total_min" class="field prepend-icon">
                                                    <input id="total_min" name="total_min" class="form-control"
                                                           disabled="disabled"/>
                                                </label>
                                            </div>

                                            <div class="col-md-6">
                                                <label for="total_mean"
                                                       class="field-label text fs14 mb10">平均尺寸：</label>
                                                <label for="total_mean" class="field prepend-icon">
                                                    <input id="total_mean" name="total_mean" class="form-control"
                                                           disabled="disabled"/>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default ">
                                <div class="panel-heading " style="height:40px;line-height:39px;">极限法
                                </div>
                                <div class="panel heading-border">
                                    <div class="panel-body bg-light">
                                        <div class="section">
                                            <div class="col-md-6">
                                                <label for="sum_sqrt_tol"
                                                       class="field-label text fs14 mb10">平均公差：</label>
                                                <label for="sum_sqrt_tol" class="field prepend-icon">
                                                    <input id="sum_sqrt_tol" name="square_tol" class="form-control"
                                                           disabled="disabled"/>
                                                </label>
                                            </div>
                                            <div class="col-md-6">
                                                <label for="extremity_max"
                                                       class="field-label text fs14 mb10">最大极限尺寸：</label>
                                                <label for="extremity_max" class="field prepend-icon">
                                                    <input id="extremity_max" name="contribution"
                                                           class="form-control"
                                                           disabled="disabled"/>
                                                </label>
                                            </div>
                                            <div class="col-md-6">
                                                <label for="extremity_min"
                                                       class="field-label text fs14 mb10">最小极限尺寸：</label>
                                                <label for="extremity_min" class="field prepend-icon">
                                                    <input id="extremity_min" name="extremity_min"
                                                           class="form-control"
                                                           disabled="disabled"/>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer text-right" id="print">
                        <input type="button" class="btn btn-primary" onclick="print()" id="print_btn" value="打印"/>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <!-- end: .admin-form -->
        </div>
        <!-- end: .tray-center -->
        </div>
    </section>
    <!-- End: Content -->
</section>
<!-- End: Content-Wrapper -->
</div>


<jsp:include page="../footer.jsp"/>