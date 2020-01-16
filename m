Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DD82713DEE5
	for <lists+cocci@lfdr.de>; Thu, 16 Jan 2020 16:36:43 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 00GFaDHZ001125;
	Thu, 16 Jan 2020 16:36:13 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id E36C977FF;
	Thu, 16 Jan 2020 16:36:12 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 541BE77E5
 for <cocci@systeme.lip6.fr>; Thu, 16 Jan 2020 16:36:10 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 00GFa4hZ014606
 for <cocci@systeme.lip6.fr>; Thu, 16 Jan 2020 16:36:04 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,326,1574118000"; d="scan'208";a="336066506"
Received: from roc044r.vpn.inria.fr ([128.93.183.44])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jan 2020 16:36:04 +0100
Date: Thu, 16 Jan 2020 16:36:04 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20200116104448.15539-3-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.2001161635500.3888@hadrien>
References: <20200116051843.3328-1-jaskaransingh7654321@gmail.com>
 <20200116104448.15539-1-jaskaransingh7654321@gmail.com>
 <20200116104448.15539-3-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 16 Jan 2020 16:36:13 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 16 Jan 2020 16:36:04 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH 2/2] tests: Add test case for * const *
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



On Thu, 16 Jan 2020, Jaskaran Singh wrote:

> Previously, a space would not be added after the * const. Add
> a test case for testing spacing with use of the type.
>
> Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>

Applied, thanks.

julia

> ---
>  tests/ptrconstptr.c     | 3 +++
>  tests/ptrconstptr.cocci | 7 +++++++
>  tests/ptrconstptr.res   | 3 +++
>  3 files changed, 13 insertions(+)
>  create mode 100644 tests/ptrconstptr.c
>  create mode 100644 tests/ptrconstptr.cocci
>  create mode 100644 tests/ptrconstptr.res
>
> diff --git a/tests/ptrconstptr.c b/tests/ptrconstptr.c
> new file mode 100644
> index 00000000..a2a3cf71
> --- /dev/null
> +++ b/tests/ptrconstptr.c
> @@ -0,0 +1,3 @@
> +void main() {
> +	const char * const * x;
> +}
> diff --git a/tests/ptrconstptr.cocci b/tests/ptrconstptr.cocci
> new file mode 100644
> index 00000000..030bc024
> --- /dev/null
> +++ b/tests/ptrconstptr.cocci
> @@ -0,0 +1,7 @@
> +@@
> +type t;
> +@@
> +void main() {
> +-	t x;
> ++	t y;
> +}
> diff --git a/tests/ptrconstptr.res b/tests/ptrconstptr.res
> new file mode 100644
> index 00000000..f5b2210c
> --- /dev/null
> +++ b/tests/ptrconstptr.res
> @@ -0,0 +1,3 @@
> +void main() {
> +	const char *const *y;
> +}
> --
> 2.21.1
>
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
