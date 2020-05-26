Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A77A61BAAA4
	for <lists+cocci@lfdr.de>; Mon, 27 Apr 2020 19:03:25 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 03RH3965016212;
	Mon, 27 Apr 2020 19:03:09 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id A7579782D;
	Mon, 27 Apr 2020 19:03:09 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id DF70C7769
 for <cocci@systeme.lip6.fr>; Mon, 27 Apr 2020 19:03:07 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 03RH37Am004821
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Mon, 27 Apr 2020 19:03:07 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,324,1583190000"; d="scan'208";a="347097799"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 19:03:07 +0200
Date: Mon, 27 Apr 2020 19:03:06 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20200427120834.380-7-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.2004271902090.12657@hadrien>
References: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
 <20200427120834.380-7-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 27 Apr 2020 19:03:09 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 27 Apr 2020 19:03:07 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH 06/23] parsing_cocci: compute_lines: Reflect
 Parameter attributes
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

> Parameter attributes are added to the SmPL AST. Reflect these changes in
> compute_lines.ml.
>
> Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
> ---
>  parsing_cocci/compute_lines.ml | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/parsing_cocci/compute_lines.ml b/parsing_cocci/compute_lines.ml
> index 1361d842..9bf4ab06 100644
> --- a/parsing_cocci/compute_lines.ml
> +++ b/parsing_cocci/compute_lines.ml
> @@ -914,13 +914,16 @@ and is_param_dots p =
>
>  and parameterTypeDef p =
>    match Ast0.unwrap p with
> -    Ast0.VoidParam(ty) ->
> -      let ty = typeC ty in mkres p (Ast0.VoidParam(ty)) ty ty
> -  | Ast0.Param(ty,Some id) ->
> +    Ast0.VoidParam(ty,attr) ->
> +      let attr = List.map normal_mcode attr in
> +      let ty = typeC ty in mkres p (Ast0.VoidParam(ty,attr)) ty ty

I think you would need to do something with promote_mcode for the attr
cases.  The last argument should reflect the largest line of the whole
term.

julia

> +  | Ast0.Param(ty,Some id,attr) ->
>        let id = ident id in
> -      let ty = typeC ty in mkres p (Ast0.Param(ty,Some id)) ty id
> -  | Ast0.Param(ty,None) ->
> -      let ty = typeC ty in mkres p (Ast0.Param(ty,None)) ty ty
> +      let attr = List.map normal_mcode attr in
> +      let ty = typeC ty in mkres p (Ast0.Param(ty,Some id,attr)) ty id
> +  | Ast0.Param(ty,None,attr) ->
> +      let attr = List.map normal_mcode attr in
> +      let ty = typeC ty in mkres p (Ast0.Param(ty,None,attr)) ty ty
>    | Ast0.MetaParam(name,a,b) ->
>        let name = normal_mcode name in
>        let ln = promote_mcode name in
> --
> 2.21.1
>
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
