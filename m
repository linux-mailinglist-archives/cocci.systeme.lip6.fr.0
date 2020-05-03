Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A3C1C2EC7
	for <lists+cocci@lfdr.de>; Sun,  3 May 2020 21:32:54 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 043JWde0019341;
	Sun, 3 May 2020 21:32:39 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 3F5467828;
	Sun,  3 May 2020 21:32:39 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 2F7C13C89
 for <cocci@systeme.lip6.fr>; Sun,  3 May 2020 21:32:38 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 043JWaTU004047
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Sun, 3 May 2020 21:32:37 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,349,1583190000"; d="scan'208";a="347594006"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 May 2020 21:32:36 +0200
Date: Sun, 3 May 2020 21:32:36 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20200428170228.7002-23-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.2005032132191.2533@hadrien>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
 <20200428170228.7002-23-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 03 May 2020 21:32:39 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sun, 03 May 2020 21:32:37 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH 22/32] parsing_c: pretty_print_c: Reflect Cast
 attributes
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



On Tue, 28 Apr 2020, Jaskaran Singh wrote:

> Cast attributes are added to the SmPL AST. Print these attributes in
> pretty_print_c.ml.
>
> Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
> ---
>  parsing_c/pretty_print_c.ml | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/parsing_c/pretty_print_c.ml b/parsing_c/pretty_print_c.ml
> index 99a7e0ed..96a11d72 100644
> --- a/parsing_c/pretty_print_c.ml
> +++ b/parsing_c/pretty_print_c.ml
> @@ -146,8 +146,9 @@ let mk_pretty_printers
>  	pp_expression e
>      | SizeOfType  (t),     [i1;i2;i3] ->
>          pr_elem i1; pr_elem i2; pp_type t; pr_elem i3
> -    | Cast    (t, e),      [i1;i2] ->
> -        pr_elem i1; pp_type t; pr_elem i2; pp_expression e
> +    | Cast    (t, e, a),      [i1;i2] ->

Less space in front of the [

julia

> +        pr_elem i1; pp_type t; pr_elem i2; pp_expression e;
> +        a +> pp_attributes pr_elem pr_space
>
>      | StatementExpr (statxs, [ii1;ii2]),  [i1;i2] ->
>          pr_elem i1;
> @@ -184,7 +185,7 @@ let mk_pretty_printers
>      | CondExpr (_,_,_) | Sequence (_,_) | Assignment (_,_,_)
>      | Postfix (_,_) | Infix (_,_) | Unary (_,_) | Binary (_,_,_)
>      | ArrayAccess (_,_) | RecordAccess (_,_) | RecordPtAccess (_,_)
> -    | SizeOfExpr (_) | SizeOfType (_) | Cast (_,_)
> +    | SizeOfExpr (_) | SizeOfType (_) | Cast (_,_,_)
>      | StatementExpr (_) | Constructor _
>      | ParenExpr (_) | New (_) | Delete (_,_)
>      | Defined (_)),_ -> raise (Impossible 95)
> --
> 2.21.1
>
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
