Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 343181BAB53
	for <lists+cocci@lfdr.de>; Mon, 27 Apr 2020 19:32:00 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 03RHVgiK016808;
	Mon, 27 Apr 2020 19:31:42 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id F1310782D;
	Mon, 27 Apr 2020 19:31:41 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id B6CDE7769
 for <cocci@systeme.lip6.fr>; Mon, 27 Apr 2020 19:31:40 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 03RHVeNg009320
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Mon, 27 Apr 2020 19:31:40 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,324,1583190000"; d="scan'208";a="347099725"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 19:31:39 +0200
Date: Mon, 27 Apr 2020 19:31:39 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20200427120834.380-23-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.2004271931170.12657@hadrien>
References: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
 <20200427120834.380-23-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 27 Apr 2020 19:31:43 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 27 Apr 2020 19:31:40 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH 22/23] tests: Add test case for removing
 parameter attributes
X-BeenThere: cocci@systeme.lip6.fr
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: <cocci.systeme.lip6.fr>
List-Unsubscribe: <https://systeme.lip6.fr/mailman/options/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=unsubscribe>
List-Archive: <https://systeme.lip6.fr/pipermail/cocci>
List-Post: <mailto:cocci@systeme.lip6.fr>
List-Help: <mailto:cocci-request@systeme.lip6.fr?subject=help>
List-Subscribe: <https://systeme.lip6.fr/mailman/listinfo/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr



On Mon, 27 Apr 2020, Jaskaran Singh wrote:

> Add a test case for removing Parameter attributes. The test case checks
> correct removal of the attribute when it is:
>
> - before the parameter type.
> - after the parameter type and before the parameter identifier.
> - after the parameter identifier.
>
> Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
> ---
>  tests/remove_param_attrs.c     | 11 +++++++++++
>  tests/remove_param_attrs.cocci | 13 +++++++++++++
>  tests/remove_param_attrs.res   | 11 +++++++++++
>  3 files changed, 35 insertions(+)
>  create mode 100644 tests/remove_param_attrs.c
>  create mode 100644 tests/remove_param_attrs.cocci
>  create mode 100644 tests/remove_param_attrs.res
>
> diff --git a/tests/remove_param_attrs.c b/tests/remove_param_attrs.c
> new file mode 100644
> index 00000000..8ec1ffde
> --- /dev/null
> +++ b/tests/remove_param_attrs.c
> @@ -0,0 +1,11 @@
> +int func1(int x, __nocast int y) {
> +	return 0;
> +}
> +
> +int func2(int x, int __nocast y) {
> +	return 0;
> +}
> +
> +int func3(int x, int y __nocast) {
> +	return 0;
> +}
> diff --git a/tests/remove_param_attrs.cocci b/tests/remove_param_attrs.cocci
> new file mode 100644
> index 00000000..43f5a204
> --- /dev/null
> +++ b/tests/remove_param_attrs.cocci
> @@ -0,0 +1,13 @@
> +@@
> +type T,U;
> +attribute name __nocast;
> +identifier x,y;
> +@@
> +
> +T x(
> +    ...,
> +    U y
> +-	__nocast

So the idea is that the attribute is removed no matter where it occurs?

julia

> +    ,
> +    ...
> +  ) {...}
> diff --git a/tests/remove_param_attrs.res b/tests/remove_param_attrs.res
> new file mode 100644
> index 00000000..3705e814
> --- /dev/null
> +++ b/tests/remove_param_attrs.res
> @@ -0,0 +1,11 @@
> +int func1(int x, int y) {
> +	return 0;
> +}
> +
> +int func2(int x, int y) {
> +	return 0;
> +}
> +
> +int func3(int x, int y) {
> +	return 0;
> +}
> --
> 2.21.1
>
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
