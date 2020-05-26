Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 904971C2EC3
	for <lists+cocci@lfdr.de>; Sun,  3 May 2020 21:28:38 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 043JSOke023380;
	Sun, 3 May 2020 21:28:24 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id C5D197828;
	Sun,  3 May 2020 21:28:24 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 071B93C89
 for <cocci@systeme.lip6.fr>; Sun,  3 May 2020 21:28:23 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 043JSMP2023208
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Sun, 3 May 2020 21:28:22 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,349,1583190000"; d="scan'208";a="347593895"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 May 2020 21:28:22 +0200
Date: Sun, 3 May 2020 21:28:21 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20200428170228.7002-10-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.2005032127520.2533@hadrien>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
 <20200428170228.7002-10-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 03 May 2020 21:28:24 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sun, 03 May 2020 21:28:22 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH 09/32] parsing_cocci: arity: Reflect Cast
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

> Cast attributes are added to the SmPL AST. Reflect these changes in
> arity.ml.
>
> Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
> ---
>  parsing_cocci/arity.ml | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/parsing_cocci/arity.ml b/parsing_cocci/arity.ml
> index 8ee6d33f..880cd7a3 100644
> --- a/parsing_cocci/arity.ml
> +++ b/parsing_cocci/arity.ml
> @@ -254,13 +254,14 @@ let rec top_expression opt_allowed tgt expr =
>        let ar = mcode ar in
>        let field = ident false arity field in
>        make_exp expr tgt arity (Ast0.RecordPtAccess(exp,ar,field))
> -  | Ast0.Cast(lp,ty,rp,exp) ->
> +  | Ast0.Cast(lp,ty,attr,rp,exp) ->
>        let arity = exp_same (mcode2line lp) [mcode2arity lp;mcode2arity rp] in
>        let lp = mcode lp in
>        let ty = typeC arity ty in
> +      let attr = List.map mcode attr in

Since attrs are mcodes, they should be reflected in the list that is given
to exp_same.

julia


>        let rp = mcode rp in
>        let exp = expression arity exp in
> -      make_exp expr tgt arity (Ast0.Cast(lp,ty,rp,exp))
> +      make_exp expr tgt arity (Ast0.Cast(lp,ty,attr,rp,exp))
>    | Ast0.SizeOfExpr(szf,exp) ->
>        let arity = exp_same (mcode2line szf) [mcode2arity szf] in
>        let szf = mcode szf in
> --
> 2.21.1
>
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
